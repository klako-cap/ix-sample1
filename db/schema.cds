using { Currency, Country } from '@sap/cds/common';
namespace ix.cap;

entity Products {
  key ID       : Integer;
      name     : localized String(100) not null @title: '{i18n>name}'; 
      price    : Decimal(9,2)                   @title: '{i18n>price}';
      retail   : Decimal(9,2)                   @title: '{i18n>retail}';
      virtual margin : Decimal(9,2)             @title: '{i18n>margin}';
      currency : Currency;
      supplier : Association to Suppliers;
}

entity Suppliers {
  key ID       : Integer;
      name     : String(100);
      country  : Country;
      rating   : Integer @assert.range: [ 1, 4 ];
      products : Association to many Products 
                on products.supplier = $self;
}
