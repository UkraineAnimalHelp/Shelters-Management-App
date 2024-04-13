```mermaid
%%{init: {
    "theme": "base",
    "themeVariables": {
        "primaryColor": "#42a7f5",
        "primaryTextColor": "#333",
        "primaryBorderColor": "#42a7f5",
        "lineColor": "#333",
        "secondaryColor": "#333",
        "fontSize": "25px"
    }
} }%%
erDiagram 
    Account {
        String uuid PK, FK
        String organiationName
    }

    Shelter {
        String accountUUID FK
        String uuid PK
        String name
        String[] phones
    }

    AccessGroup {
        String uuid PK
        String accountUUID FK 
        String name
        int user
        int group
        int shelter
        int animal
        int animalTreatment
        int animalMedicalDocs
    }

    Employee {
        String uuid PK
        String accountUUID FK
        bool isOwner
        String firstName
        String lastName
        String photoPath
        String[] phones
        String[] links
        String[] inShelters
        String[] inAccessGroups 
    }

    Animal {
        String uuid PK
        String accountUUID FK
        String inShelter
        String assignedToEmployees
        String name
        String notes
        Unixtime added
        Unixtime died
        Unixtime adopted
        String[] tags
        String photoPath
        Unixtime birthday
        Gender gender
        AnimalType type
        Metric[] weights
        Metric[] temperatures
        Treatment[] treatments
        Vaccination[] vaccinations
        Photo[] photos
    }

    Vaccination {
        String uuid PK
        Unixtime date
        String name
        String notes
    }

    Treatment {
        String uuid PK
        String name
        String notes
        Unixtime start
        Unixtime end
        TimeOfDay[] timesOfDay
        int repeatEveryDays
    }

    Task {
        String uuid
        TaskType type
        Map data
        String accountUUID FK 
        String animalUUID FK
        String treatmentUUID FK
        String employeeUUID FK
        String title
        String body
        bool isDone
        Unixtime timestamp
        Timestamp ttl
    }

    ActionLogs {
        String uuid PK
        String accountUUID FK 
        String action
        String animalUUID
        String shelterName
        String employeeName 
        Unixtime datetime
        Timestamp ttl
    }


    Note {
        String uuid PK
        Unixtime date
        String notes
    }

    Photo {
        String uuid PK
        Unixtime date
        String path
        String notes
    }

    Metric {
        String uuid PK
        Unixtime date
        double value
    }

    Shelter }o--|| Account : Linked
    Employee }|--|| Account : Linked
    Animal }o--|| Account : Linked
    AccessGroup }o--|| Account : Linked
    ActionLogs }o--|| Account : Linked
    Employee ||--|{ AccessGroup: Assigned
    Employee ||--o{ Shelter: Assigned
    Animal ||--|| Shelter: Live-in
    Animal ||--o{ Metric: Contains
    Animal ||--o{ Photo: Contains
    Animal ||--o{ Treatment: Contains
    Animal ||--o{ Vaccination: Contains
    Animal ||--o{ Task: Assigned
    Animal ||--o{ ActionLogs: MayBeLinked
