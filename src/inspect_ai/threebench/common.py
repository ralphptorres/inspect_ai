from pathlib import Path
from inspect_ai.schema import TaskConfig
from inspect_ai.dataset import Sample


def convert_task_config_to_sample(task_config: TaskConfig) -> tuple[str, Sample]:
    files = {}

    for env_name, env_config in task_config.environments.items():
        if "Dockerfile" in env_config.files:
            dockerfile = env_config.files["Dockerfile"]
            del env_config.files["Dockerfile"]
        else:
            raise ValueError(f"Dockerfile not found in {env_name}")
        files.update(env_config.files)

    if not dockerfile:
        raise ValueError(f"Dockerfile not found in {task_config.name}")

    setup_sh = files.get("setup.sh", None)

    sample = Sample(
        id=task_config.name,  # Assuming the name is used as the ID
        input=task_config.elicitations[0].prefilled_messages[0].content,
        target=task_config.ruleset.flag,  # Assuming the version is used as the target
        # metadata={
        #     "source": task_config.environments,  # Assuming environments are used as source
        #     "tags": task_config.tags,  # Using tags from TaskConfig
        #     "solution": None,  # Assuming solution is not defined in task_config
        # },
        files=files,
        setup=setup_sh,
    )
    return (dockerfile, sample)


def load_and_convert_toml_to_sample(toml_file_path: Path) -> tuple[str, Sample]:
    task_config = TaskConfig.from_config(toml_file_path)
    dockerfile, sample = convert_task_config_to_sample(task_config)
    return dockerfile, sample
