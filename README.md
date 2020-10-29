# A simple CAP Sample

### Order of doing things ...

1. ``cds init ix-sample1``
2. Start IDE in project folder
3. Fill ``db/`` and ``srv/`` folders with model cds-files
4. Start ``cds watch``
5. Maintain test data in ``db/data/``
6. Compute margin in ``after.READ`` handler
7. Implement test for positive margin in ``before.CREATE`` handler
8. Test POST-Request with HTTP-client
9. Deploy to HANA with ``cds deploy --to hana``
10. Do ``cds build``
11. Deploy to Cloud Foundry


