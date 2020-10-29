using ix.cap as domain from '../db/schema';
@(path: '/cat')
service CatalogService {
    entity Products as projection on domain.Products;
    @readonly entity Suppliers as projection on domain.Suppliers; 
}