// Import domain model
using ix.cap as domain from '../db/schema';

// Expose all operations on Products and Suppliers
service CatalogService {
    entity Products as projection on domain.Products;
    entity Suppliers as projection on domain.Suppliers;
}

// Expose restricted, non-updatable views
@path: '/cat/de'
service BrowseCatalogDE {
    entity Products as select * from domain.Products 
        where supplier.country.code = 'DE';
    entity Suppliers as select * from domain.Suppliers
        where country.code = 'DE'; 
}

// suppress autoexposure of Entity Countries which is referenced by type Country used in the domain model
annotate sap.common.Countries with @cds.autoexpose: false;