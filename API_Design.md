 Atomic Feature List

1. Add a new department  
2. View all departments  
3. Update department details  
4. Add a new employee  
5. View all employees  
6. View a single employee’s details  
7. Update employee information  
8. Deactivate an employee  
9. Add a new asset category  
10. View all asset categories  
11. Add a new asset  
12. View all assets  
13. View a single asset’s details  
14. Update asset information  
15. Assign an asset to an employee  
16. View all asset assignments  
17. Return an assigned asset  
18. Update asset status  
19. View asset status history  
20. Record asset maintenance or damage reason  
---

API Endpoint Mapping and Database Actions

### Feature: Add a new department
API Endpoint: POST /api/departments  
Database Action: INSERT a new row into the departments table with department_name and description.
---
### Feature: View all departments
API Endpoint: GET /api/departments  
Database Action: SELECT all rows from the departments table.
---
### Feature: Update department details
API Endpoint: PUT /api/departments/{department_id}  
Database Action: UPDATE department_name and description in the departments table.
---
### Feature: Add a new employee
API Endpoint: POST /api/employees  
Database Action: INSERT a new row into the employees table with employee_code, name, email, department_id, designation, and joining date.
---
### Feature: View all employees
API Endpoint: GET /api/employees  
Database Action: SELECT all rows from the employees table.
---
### Feature: View a single employee’s details
API Endpoint: GET /api/employees/{employee_id}  
Database Action: SELECT a specific employee record using employee_id.
---
### Feature: Update employee information
API Endpoint: PUT /api/employees/{employee_id}  
Database Action: UPDATE employee details in the employees table.
---
### Feature: Deactivate an employee
API Endpoint: PATCH /api/employees/{employee_id}/status  
Database Action: UPDATE employment_status in the employees table.
---
### Feature: Add a new asset category
API Endpoint: POST /api/asset-categories  
Database Action: INSERT a new row into the asset_categories table.
---
### Feature: View all asset categories
API Endpoint: GET /api/asset-categories  
Database Action: SELECT all rows from the asset_categories table.
---
### Feature: Add a new asset
API Endpoint: POST /api/assets  
Database Action: INSERT a new row into the assets table with asset details and initial status.
---
### Feature: View all assets
API Endpoint: GET /api/assets  
Database Action: SELECT all rows from the assets table.
---
### Feature: View a single asset’s details
API Endpoint: GET /api/assets/{asset_id}  
Database Action: SELECT asset details using asset_id.
---
### Feature: Update asset information
API Endpoint: PUT /api/assets/{asset_id}  
Database Action: UPDATE asset details in the assets table.
---
### Feature: Assign an asset to an employee
API Endpoint: POST /api/asset-assignments  
Database Action:  
- INSERT a new row into the asset_assignments table  
- UPDATE asset_status to 'Assigned' in the assets table
---
### Feature: View all asset assignments
API Endpoint: GET /api/asset-assignments  
Database Action: SELECT all rows from the asset_assignments table.
---
### Feature: Return an assigned asset
API Endpoint: POST /api/asset-assignments/{assignment_id}/return  
Database Action:  
- UPDATE actual_return_date in asset_assignments  
- UPDATE asset_status to 'Available' in assets
---
### Feature: Update asset status
API Endpoint: PATCH /api/assets/{asset_id}/status  
Database Action:  
- UPDATE asset_status in assets  
- INSERT a new row into asset_status_history
---
### Feature: View asset status history
API Endpoint: GET /api/assets/{asset_id}/status-history  
Database Action: SELECT status records from asset_status_history for the asset.
---
### Feature: Record asset maintenance or damage
API Endpoint: POST /api/assets/{asset_id}/maintenance  
Database Action: INSERT a new row into asset_status_history with reason and changed_by.