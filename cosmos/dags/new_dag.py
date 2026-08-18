from cosmos import ProjectConfig, ProfileConfig, ExecutionConfig, ExecutionMode, DbtDag
import os
from datetime import datetime

DBT_PROJECT_PATH = f"{os.getenv('AIRFLOW_HOME')}/dags/dbt/winerevsdata"
PROFILES_PATH = f"{os.getenv('AIRFLOW_HOME')}/dags/.dbt/profiles.yml"
DBT_EXECUTABLE_PATH = f"{os.getenv('AIRFLOW_HOME')}/dbt_venv/bin/dbt"

_project_config = ProjectConfig(
    dbt_project_path = DBT_PROJECT_PATH
)

_profile_config = ProfileConfig(
    profile_name = "winerevsdata",
    target_name = "dev",
    profiles_yml_filepath = PROFILES_PATH
)

_execution_config = ExecutionConfig(
    dbt_executable_path = DBT_EXECUTABLE_PATH,
    execution_mode=ExecutionMode.LOCAL
)

my_dag = DbtDag(
    dag_id = "my_dag",
    project_config = _project_config,
    profile_config = _profile_config,
    execution_config =_execution_config,
    schedule = "@daily",
    start_date = datetime(2026,1,1),
    max_active_tasks = 1,
)