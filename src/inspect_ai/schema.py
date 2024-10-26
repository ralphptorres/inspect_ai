from pydantic import BaseModel, Field, field_validator
from typing import List, Dict, Optional
import toml
from enum import Enum


class RunTerminalInteropProtocol(str, Enum):
    CLOSING_ANGLE_BRACKET = "CLOSING_ANGLE_BRACKET"
    MARKDOWN_CODE_BLOCKS = "MARKDOWN_CODE_BLOCKS"
    JSON_BASIC = "JSON_BASIC"
    XML_TAGS = "XML_TAGS"


class DockerConfig(BaseModel):
    hostname: str = "simurgh"
    cpu_period: int = 100000
    cpu_quota: int = 200000
    mem_limit: str = "8g"
    cap_add: List[str] = ["NET_RAW"]
    ip_address: Optional[str] = None

    @classmethod
    def make_default(cls):
        return DockerConfig()


class ChallengeConfig(BaseModel):
    name: str
    image_name: str
    golden_output: str
    docker_config: DockerConfig = Field(default_factory=DockerConfig.make_default)


class AgentConfig(BaseModel):
    identifier: str
    parameters: Dict[str, str]


class PrefilledMessage(BaseModel):
    role: str
    content: str

    @field_validator("content")
    @classmethod
    def strip_whitespace(cls, content):
        return content.strip()


class RunConfig(BaseModel):
    max_turn_number: int = Field(gt=0)
    terminal_interop_protocol: RunTerminalInteropProtocol
    prefilled_messages: List[PrefilledMessage]


class CTFConfig(BaseModel):
    config_version: str
    challenge: ChallengeConfig
    agent: AgentConfig
    run: RunConfig
    description: Optional[str] = None

    @classmethod
    def from_toml(cls, toml_path: str):
        with open(toml_path, "r") as f:
            toml_data = toml.load(f)
        return cls.model_validate(toml_data)

    def to_toml(self, toml_path: str):
        with open(toml_path, "w") as f:
            toml.dump(self.model_dump(), f)


# =====================


class Elicitation(BaseModel):
    terminal_interop_protocol: str
    prefilled_messages: List[PrefilledMessage]

    @classmethod
    def from_toml(cls, toml_content: str):
        return cls.model_validate(toml.loads(toml_content))

    def to_normalized_toml(self) -> str:
        python_dict = self.model_dump(
            by_alias=True,
            exclude_none=True,
            include={"terminal_interop_protocol", "prefilled_messages"},
        )
        return toml.dumps(python_dict)


class EnvironmentConfig(BaseModel):
    docker: DockerConfig = Field(default_factory=DockerConfig.make_default)
    files: Dict[str, str]
    files_b64: Dict[str, str] = Field(default_factory=dict)


class RulesetConfig(BaseModel):
    max_turns: int
    flag: str


class TaskConfig(BaseModel):
    # increment when adding breaking changes, or implement conversion
    name: str
    version: str = Field(pattern=r"0\.3")
    tags: Dict[str, str] = Field(default_factory=dict)
    ruleset: RulesetConfig
    environments: Dict[str, EnvironmentConfig]
    elicitations: List[Elicitation]

    @classmethod
    def from_toml(cls, toml_content: str):
        return cls.model_validate(toml.loads(toml_content))

    @classmethod
    def from_config(cls, config_path: str) -> "TaskConfig":
        with open(config_path, "r") as f:
            return TaskConfig.from_toml(f.read())

    def to_toml(self) -> str:
        python_dict = self.model_dump(by_alias=True, exclude_none=True)
        return toml.dumps(python_dict)

    def to_normalized_toml(self) -> str:
        python_dict = self.model_dump(
            by_alias=True,
            exclude_none=True,
            include={"version", "ruleset", "environments"},
        )
        return toml.dumps(python_dict)


def test_from_toml():
    toml_content = """
version = "0.2"
name = "test chal"
[ruleset]
max_turns = "10"
flag = "test_flag"
[environments.main.files]
"test.txt" = "content"
[[elicitations]]
terminal_interop_protocol = "test"
[[elicitations.prefilled_messages]]
role = "user"
content = "test message"
  """.strip()

    task_config = TaskConfig.from_toml(toml_content)

    assert task_config.version == "0.2"
    assert task_config.ruleset.flag == "test_flag"
    assert task_config.environments["main"].files["test.txt"] == "content"
    assert task_config.elicitations[0].prefilled_messages[0].content == "test message"

    assert (
        task_config.to_normalized_toml()
        == """
version = "0.2"

[ruleset]
max_turns = 10
flag = "test_flag"

[environments.main.docker]
hostname = "simurgh"
cpu_period = 100000
cpu_quota = 200000
mem_limit = "8g"
cap_add = [ "NET_RAW",]

[environments.main.files]
"test.txt" = "content"
  """.strip()
        + "\n"
    )


def test_golden():
    task_config = TaskConfig.from_config("task_configs/impact_defacing.toml")


# Example usage with validation
if __name__ == "__main__":
    try:
        config = CTFConfig(
            config_version="0.1",
            challenge=ChallengeConfig(
                name="debian_dummy_processes",
                image_name="debian_dummy_processes",
                golden_output="abractf{abcdef123456}",
            ),
            agent=AgentConfig(
                identifier="together",
                parameters={"model_name": "mistralai/Mixtral-8x7B-Instruct-v0.1"},
            ),
            run=RunConfig(
                max_turn_number=10,
                terminal_interop_protocol="MARKDOWN_CODE_BLOCKS",
                prefilled_messages=[
                    PrefilledMessage(
                        role="user",
                        content="You are an experienced security researcher...",
                    )
                ],
            ),
        )
        print("Config is valid!")
    except ValueError as e:
        print(f"Validation error: {e}")

    # Try with invalid data
    try:
        invalid_config = CTFConfig(
            config_version="0.1.0",  # Invalid version format
            challenge=ChallengeConfig(
                name="",  # Empty name
                image_name="debian_dummy_processes",
                golden_output="invalid_flag",  # Doesn't match regex
            ),
            agent=AgentConfig(
                identifier="together",
                parameters={"model_name": "mistralai/Mixtral-8x7B-Instruct-v0.1"},
            ),
            run=RunConfig(
                max_turn_number=0,  # Invalid turn number
                terminal_interop_protocol="MARKDOWN_CODE_BLOCKS",
                prefilled_messages=[],
            ),
        )
    except ValueError as e:
        print(f"Validation error (as expected): {e}")
