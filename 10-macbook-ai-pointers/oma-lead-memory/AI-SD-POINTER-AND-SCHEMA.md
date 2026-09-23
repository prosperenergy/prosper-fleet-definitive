# MACBOOK AI SD — pointer + schema (headers only)

**Purpose:** Oma memory for later lead/customer asks. Do NOT duplicate the ~22 GB LEADS-AND-INSTALLS tree.

## Volume
- Mount: `/Volumes/MACBOOK AI` (built-in SD, ~119 Gi capacity, ~22 Gi used on this volume for leads)
- Canonical leads folder: `/Volumes/MACBOOK AI/LEADS-AND-INSTALLS`
- Also: `/Volumes/MACBOOK AI/LEADS` (smaller; includes MA Battery HEAT Loan pack)
- Desk note: `/Users/craigstratton/Desktop/MACBOOK-AI-LEADS-AND-INSTALLS.md`
- Symlinks in this folder: `MACBOOK-AI-LEADS-AND-INSTALLS` → volume folder; `MACBOOK-AI-LEADS` → `/Volumes/MACBOOK AI/LEADS`
- If unmounted: volume name is `MACBOOK AI` (not T9)

## Key files (paths + counts; no PII rows)

| Path under LEADS-AND-INSTALLS | Type | Approx size | Rows (excl header) / sheets |
|---|---|---|---|
| `Powur-Leads-2026-09-11.csv` | CSV | 711K | 1360 rows, 41 cols |
| `prosper_pipeline_leads.csv` | CSV | 2.0M | 8815 rows, 21 cols |
| `Prosper Non-Installed Contacts 2026-09-11/Non-Installed-Contacts-2026-09-11.csv` | CSV | 357K | 1195 rows, 14 cols |
| `ProjectsCSV-2026-09-12 00-40-17.csv` | CSV | 27K | 76 rows, 25 cols |
| `battery upgradeable list/ALL-installed-solar-by-state.csv` | CSV | 165K | 770 rows, 12 cols |
| `Powur-Full-Export-2026-09-11.xlsx` | XLSX | 1.9M | sheets: Summary(23), Priority Resell(48), Sales & Resell(342), All Powur Projects(1500), All Leads(1364), Proposals(1399), Utility Bills(765), All Assets(2606), Read Me(15) |
| `Prosper_Master_Leads_By_State_2026-06-02.xlsx` | XLSX | 5.2M | Master_Deduped **12831** data rows + many State_* sheets (FL/VA/TX largest) |
| `PROSPER-SCOTT-CALIFORNIA-LEADS-AND-INSTALLS-TRACKER-2026-09-04.xlsx` | XLSX | 4.2M | CA Leads(~13573), CA Installs(~576), Review(~9570), Source Audit(~6348) |
| `Craig-Customer-Handoff-2026-09-11.xlsx` | XLSX | 196K | Powur Installs(72), Other Installs(19), Sold and Resell(278) |
| `Craig-Installed-Sales-Handoff-2026-09-11.numbers` | Numbers | 763K | (Numbers) |
| `LEADS!!.zip` | ZIP | 164M | archived lead dumps |
| `PROSPER-LEAD-ARCHIVE-2026-09-11/` | dir | — | lead repair/archive |
| `Powur-Installs-Source-Documents-2026-09-11.zip` | ZIP | 11M | install source docs |

## Sample headers (no data rows)

### Powur-Leads-2026-09-11.csv
Include in handoff | Routing | Historical 36 name | Lead ID | Project ID | Customer | Phone | Email | Street | Unit | City | State | ZIP | Country | Lead kind | Lead source | Project type | Project stage | Project stage kind | Milestone | Project status | Qualified at | Closed at | Created at | Updated at | Qualification percent | Homeowner interest | Source Seller | Source Closer | Source Lead Owner | Source project people | Operational Seller | Operational Closer | Operational override note | Latest proposal ID | Proposal URL | Proposal count | Asset count | Utility bill count | Lead notes | Do not contact source flag

### prosper_pipeline_leads.csv
First Name | Last Name | Full Name | Phone | Email | Address | City | State | Zip | Pipeline Stage | PowerList | Status | Bill Amount | Utility Provider | Shade Roof | Area Code | Callback At | Created Date | Updated Date | DND | GHL Contact ID

### Non-Installed-Contacts-2026-09-11.csv
Customer | Phone | Email | Street | City | State | ZIP | Category | Status | Next action | Project IDs | Contact notes | Source notes | Do not contact

### Prosper_Master_Leads_By_State — Master_Deduped
State | Full Name | First Name | Last Name | Phone | Email | Address | City | ZIP | Duplicate Count | Source Type | Source File | Source Sheet | Source Row | Other Fields

## Out of scope on this volume
Leave lending/loans/bank statements in Desktop `CRAIG-REVIEW-LENDING-AND-STATEMENTS` — do not file into LEADS-AND-INSTALLS.
Do not print passwords from SD root files.
