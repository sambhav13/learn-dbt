### Using the Learn-dbt starter project

Commands used by dbt:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

# learn-dbt
-  Create a virtual env for python
    -   virtualenv env_trino
- Activate the virtual environment
    - virtualenv env_trino
-  Install dbt python dependencies
    -   pip install dbt-core
    -   pip install dbt-trino
-  Start a Catalog Server like Postgres supported as connector for Trino
    - brew services start postgressql@10(Mac)
    - For other OS run docker containes or start postgres service accordingly
-  Start Trino
    - Download Trino from Trino official website
    - extract trinno-server-375.tar.gz
    - Go the extracted folder and the bin directory
    - /Path/to/trino/375/bin/trino start
- Open Postgres using SQL client like PgAdmin4 or any other SQL supported client for postgres.
    - Create a source2 table named source having columns eventDay, dailyUsers
    - create table source2(eventDay timestamp, userId int)
- Initialize the dbt project
    - dbt init learn_trino
- Check your connection profile for trino
    -  dbt debug --config-dir
-  Setup your Profile to create a connection to the trino
    - Set following attributes by referring profiles/profiles.yml in ~/.dbt/profiles.yml
        - type: trino
        - method: none  # optional, one of {none | ldap | kerberos}
        - user: admin
        - database: postgres
        - host: 127.0.0.1
        - port: 8080
        - schema: public
- Create model scripts inside models/example folder
    - my_third_dbt_incremental_model.sql(script to create incremental view from source table as referenced
- Create respective checks on schema and add models to models/schema/schema.yaml as mentioned in this repo
incremental materialization of DBT
- Run Dbt command to do initial load of the incremental table view
    - dbt run
- Insert some more records in the source table
- run dbt again to do an incremental refresh with new records
   - dbt run

- Verify in trino server by loggingg into trino shell
    - show tables in postgres.public;
    - select * from my_third_dbt_incremental_model;

- To add new models(with incremental materialization) add new sql to models/example folder
