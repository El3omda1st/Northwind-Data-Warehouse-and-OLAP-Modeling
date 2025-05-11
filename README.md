# Northwind Data Warehouse with DBT

This project implements a modern data warehouse solution for the Northwind database using DBT (Data Build Tool). It transforms raw operational data into an analytics-ready data warehouse using dimensional modeling principles.

## 🏗️ Project Structure

```
dbt/Northwind/
├── models/
│   ├── marts/           # Final presentation layer
│   │   ├── dim_*.sql    # Dimension tables
│   │   └── fact_*.sql   # Fact tables
│   └── staging/         # Initial data cleaning layer
├── snapshots/           # Slowly Changing Dimensions
└── dbt_packages/        # DBT dependencies
```

## 📊 Data Model

### Dimension Tables
- `dim_customers`: Customer information
- `dim_products`: Product catalog
- `dim_employees`: Employee details
- `dim_suppliers`: Supplier information
- `dim_shippers`: Shipping partner details
- `dim_date`: Date dimension for time-based analysis
- `dim_order_status`: Order status information
- `dim_order_details_status`: Order details status information
- `dim_order_tax_status`: Order tax status information
- `dim_purchase_order_status`: Purchase order status information

### Fact Tables
- `fact_orders`: Order-level transactions
- `fact_invoices`: Invoice-level financial metrics
- `fact_purchase_order`: Purchase order details
- `fact_inventory`: Inventory transactions

### Slowly Changing Dimensions (SCD)
Implemented for tracking historical changes in:
- Products
- Employees
- Customers
- Shippers
- Suppliers

## 🛠️ Technical Stack

- **DBT**: Data transformation and modeling
- **PostgreSQL**: Database
- **Docker**: Containerization and environment management
- **Git**: Version control

## 🚀 Features

- Dimensional modeling with star schema
- Data quality testing and validation
- Automated data lineage
- Slowly changing dimensions for historical tracking
- Comprehensive documentation
- Modular and maintainable code structure
- Containerized development environment

## 📋 Prerequisites

- DBT Core
- PostgreSQL
- Docker
- Git

## 🏁 Getting Started

1. Clone the repository:
```bash
git clone [repository-url]
```

2. Start the Docker containers:
```bash
docker-compose up -d
```

3. Install dependencies:
```bash
dbt deps
```

4. Configure your database connection in `profiles.yml`

5. Run the models:
```bash
dbt run
```

6. Run tests:
```bash
dbt test
```

## 🧪 Data Quality

The project includes comprehensive data quality tests:
- Primary key uniqueness
- Foreign key relationships
- Not null constraints
- Value range validations
- Business logic validations

## 📈 Data Lineage

The project maintains clear data lineage through:
- DBT's built-in lineage tracking
- Clear model dependencies
- Documented transformations

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## 📝 License

[Your chosen license]

## 👥 Author

[Your Name]

## 🙏 Acknowledgments

- Northwind database
- DBT community
- [Any other acknowledgments] 