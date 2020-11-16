# A simple CAP sample service

### Order of doing things ...

1. Projekt setup
   +  ``cds init ix-sample1``
   + Start IDE in project folder
2. Maintain domain and service model
   + Fill ``db/`` and ``srv/`` folders with model cds-files
3. Testing locally
   + Start ``cds watch``. 
   + Maintain test data in ``db/data/``
4. Implement event handlers
   + Compute margin in ``after.READ`` handler. 
   + Implement test for positive margin in ``before.CREATE`` handler. 
   + Test POST-Request with curl HTTP-client
5. Localisation: Maintain languages and use ``?sap-language`` to test.
6. Deployment to SAP Cloud Platform
   + Deploy to HANA with ``cds deploy --to hana``
   + Do ``cds build``
   + Deploy to Cloud Foundry Environment


