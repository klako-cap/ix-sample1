# iX Sample Service

This is a sample project for creating two REST-services with the **SAP Cloud Application Programming Model** ([CAP](https://cap.cloud.sap/)). It has been used as an introduction to CAP within my article in the German journal [iX - Magazin für professionelle Informationstechnik](https://www.heise.de/ix/), vol. ??, [month] 2021.

## Running on a local machine
+ You need to have Node.js and SQLite installed.
+ Install the CDS Development Kit with ``npm install -g @sap/cds-dk``.
+ Clone this project to your disk and run ``npm install``.
+ Start ``cds watch`` from a terminal in project root folder
+ Open a browser at http://localhost:4004

You can change cds-files and JavaScript-files while ``cds watch`` is running. It will detect changes and will restart the server for you. There is some test data included as csv-files in folder [/db/data](/db/data). By default, cds watch is using the SQlite database in in-memory mode. 

## Connect to an SAP HANA database instance
This is a little tricky and lengthy. That's why it was too involved to describe this within the iX-article. [Here is a document](docs/HANA.md) which explains how to do this.

Note, that the file [package.json](package.json) contains a CDS database configuration section which is a little different, than listed in the iX-article:
```json
...
    "requires": {
      "db": {
        "kind": "sql"
      }
    }
...
```
The difference is the use of ``"kind": "sql"`` instead of ``"kind": "hana"``. This makes is easier to switch back and forth between deploying to SQLite and SAP HANA. ``"kind": "sql"`` is interpreted differently depending on the set **configuration profile**. There are two standard profiles which you can choose by setting the environment variable NODE_ENV to either ``development`` (or just do not set NODE_ENV), or ``production``. If the development profile is set, SQLite is used as target. If the production profile is set, SAP HANA is used as target.

So, if you want to deploy your model and data to SAP HANA, set NODE_ENV to ``production`` and spawn the command ``cds deploy``. After a successful deployment, use ``cds watch`` for testing as before. After setting back NODE_ENV to ``development``, ``cds watch`` will use SQLite again. Even simpler, you can switch to production mode once temporarily by using the ``--production`` flag, like in ``cds watch --production``. No need to change environment variables then.



## Getting more help

+ [Offical SAP CAP reference docu](https://cap.cloud.sap/)
+ [Anwendungsentwicklung auf der SAP Cloud Platform](https://www.sap-press.de/5110). German. Published by Rheinwerk Verlag.

