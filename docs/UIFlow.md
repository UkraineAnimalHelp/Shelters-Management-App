# UI Flow V1

## Good to know
* CRUD - All delete operations are using Soft Delete(data only marked as deleted)

### Tasks
The most complicated part. Tasks breaks on 2 data types: TaskConfig & Task.
Task config used to store task configuration, describing it. While Task is one of
many instance created based on task config. For example we set repeat some task
for a week. This should create 7 Tasks for each day. This is needed to have 
Task history, and see when tasks was done and when not.

This also mean that if we need to delete Task config & Tasks, we just remove future Tasks,
while past are saved. (this is the only place where we can hard delete data, as
future tasks are not needed). This also mean that update to Task Config need to
update all future Tasks or even delete & recreate future Tasks.

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
 
    A[Open App] --> Home(Home)
    Home --> Tasks(Today tasks)
    Home --> Animals(Animals)
    Home --> Knowledge(Knowledge base)
  
    style Notify fill:#e3b600,stroke:#333,color:#333,stroke-width:4px

    Tasks-->Task(Task)
    Task-->Done{{Done/Undone}}
    Task-->Filter{{Filter by type}}
    Task-->OpenAnimalProfile{{Open Animal profile}}
    OpenAnimalProfile-->AnimalProfile

    Animals-->SerchAnimal{{Search by name}}
    Animals-->FilterAnimal{{Filter by species, in shelter/adopted/died, tags}}
    Animals-->AnimalProfile(Animal Profile)

    AnimalProfile-->TaskProcedureActive(Task/Procedure active)-->TaskConfig(Task/Procedure Config)-->CRUDTaskConfig{{CRUD: title, description, start/end dtaes, recurence:hours/days/weeks/months/years, fixed times during the day}}
    TaskConfig-->Notify{{Add to calendar. Optionaly}}
    AnimalProfile-->TaskHistory(Task/Procedure history)-->FilterHistory{{Filter by date range, type:vaccine, treatment, procedure, task}}
    AnimalProfile-->CRUDAnimalProfile{{CRUD:Name, Species, birth date, alergies, photo, sex, passport id, chip id, description, tags}}
    AnimalProfile-->Metrics(Metrics: weight,temperature)-->AddMetric{{CRUD metric: wieght, temperature}}
    AnimalProfile-->MedicalDocs(Medical documents)-->CRUDAddMedicalDoc{{CRUD: title, date, image/file}}
    AnimalProfile-->AnimalGallery(Animal gallery)-->CRUDAnimalGallery{{CRUD: photo, description, date}}
    AnimalProfile-->Notes(Notes)-->CRUDNotes{{CRUD:title, description, date}}

    Knowledge-->SearchInfo{{Search Info}}
    Knowledge-->CRUDKnowledge{{CRUD: title, tags, description}}
```
