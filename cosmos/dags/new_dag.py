from cosmos import ProjectConfig, ProfileConfig, ExecutionConfig, DbtDag
import os

DBT_PROJECT_PATH = f"{os.getenv('AIRFLOW_HOME')}/dags/dbt"
PROFILES_PATH = os.path.expanduser("~/.dbt/profiles.yml")

_project_config = ProjectConfig(
    dbt_project_path = DBT_PROJECT_PATH
)

_profile_config = ProfileConfig(
    profile_name = "winerevsdata",
    target_name = "dev",
    profiles_yml_filepath = PROFILES_PATH
)

_execution_config = ExecutionConfig(
    dbt_executable_path = DBT_EXECUTABLE_PATH
)