# UI Flow

## Good to know
* CRUD - All delete operations are using Soft Delete(data only marked as deleted)
* Some update operation may be == delete & create. For example in case of treatment(task) config,
where modifying treatment time cant change already finished previous tasks.

## Flow
```mermaid
%%{init: {
    "theme": "base",
    "themeVariables": {
        "primaryColor": "#42a7f5",
        "primaryTextColor": "#fff",
        "primaryBorderColor": "#42a7f5",
        "lineColor": "#cccccc",
        "secondaryColor": "#009e3a"
    }
} }%%
flowchart LR;
    style AssingGroups fill:#e3b600,stroke:#333,color:#333,stroke-width:4px
    style GroupRights fill:#e3b600,stroke:#333,color:#333,stroke-width:4px
    style MakePDF fill:#e3b600,stroke:#333,color:#333,stroke-width:4px
    style Shelters fill:#e3b600,stroke:#333,color:#333,stroke-width:4px

    A[Open App] -->|Google Login| Register(Register Employee)-->ChooseType(Choose type)
    ChooseType(Choose type)-->RegisterOrg(Register Organization)--> Home(Home)
    ChooseType(Choose type)-->AssignToOrg(Join Organization)-->|Assigned| Home(Home)
    A[Open App] -->|Google Login| Home(Home)
    A[Open App] -->|Local Login| Home(Home)
    Home --> Tasks(Today tasks: Selected)
    Home --> Animals(Animals)
    Home --> Knowledge(Knowledge base)
    Home --> SheltersMngmt(Shelters Mngmt)
    Home --> UserSettings(User Settings)-->UpdateUserSettings[Update avatar,name,phone]

    Tasks-->Task(Task)
    Task-->Done{{Done}}
    Task-->Filter{{Filter}}
    Task-->Notify{{Add to calendar}}
    Task-->OpenTaskConfig{{Open configuration}}
    OpenTaskConfig-->TaskConfig(Task/Procedure Config)-->CRUDTaskConfig{{CRUD}}

    Animals-->SerchAnimal{{Search Animal}}
    Animals-->AnimalProfile(Animal Profile)
    AnimalProfile-->TaskConfig
    AnimalProfile-->TaskHistory(Task/Procedure history)-->FilterHistory{{Filter}}
    AnimalProfile-->CRUDAnimalProfile{{CRUD}}
    AnimalProfile-->Metrics(Metrics)-->AddMetric{{Add metric}}
    AnimalProfile-->MedicalDocs(Medical documents)-->CRUDAddMedicalDoc{{CRUD}}
    AnimalProfile-->AnimalGallery(Animal gallery)-->CRUDAnimalGallery{{CRUD}}
    AnimalProfile-->MakePDF(Version2: Convert profile to PDF)-->Generate{{Generate}}

    Knowledge-->SearchInfo{{Search Info}}
    Knowledge-->CRUDKnowledge{{CRUD}}

    SheltersMngmt-->Shelters(Version2: Shelters)-->CRUDShelters{{CRUD}}
    SheltersMngmt-->Stuff(Stuff)-->CRUDStuff{{AddByID & list}}
    Stuff(Stuff)-->AssingGroups{{Version2: Assing to Groups}}
    Stuff(Stuff)-->AssingShelters{{Assing to Shelters}}
    SheltersMngmt-->GroupRights(Version2: Group Rights)-->CRUDGroupRights{{CRUD}}
```
