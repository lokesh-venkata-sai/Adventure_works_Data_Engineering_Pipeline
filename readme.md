Data Source: https://www.kaggle.com/datasets/ukveteran/adventure-works

Steps followed:

- Create resource group --> `AWPROJECT`
- Inside resource group --> we can create a resource
    - create storage account --> `lmamidiawstorage`
        - Primary service: Azure Data Lake storage Gen 2
        - Performance: standard
        - Redundancy: Locally-redundant storage (LRS)
        - Enable hierarchical namespace --> This will create Data lake insetad of blob storage
        - Access tier: `Hot`
        - Then create
    - create azure datafactory --> `lmamidi-adf-aw`
- In Azure storage account --> Left side pane: In data storage --> click on containers
    - create 3 containers for Bronze, Silver, Gold layers
- In Azure Datafactory, Open azure data factory studio to create zones
    - In Author tab: create a pipleine `GitToRaw`
        - Drag "Copy Data" activity and name it as `CopyRawData`
        - 


