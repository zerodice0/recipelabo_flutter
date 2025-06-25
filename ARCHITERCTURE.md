graph TD
    subgraph Presentation Layer [UI & 상태 관리]
        View["View (화면, Widget)"]
        ViewModel["ViewModel (Riverpod Provider)"]
    end

    subgraph Domain Layer [핵심 비즈니스 로직]
        UseCase["UseCase (비즈니스 로직 캡슐화)"]
        RepositoryInterface["Repository Interface (규칙/계약)"]
        Entities["Entities (순수 데이터 객체)<br>RecipeGroup, RecipeVersion"]
    end

    subgraph Data Layer [데이터 처리 및 저장소]
        RepositoryImpl["Repository Implementation (구현체)"]
        DataSource["DataSource (Local: sqflite)"]
        Models["Models (데이터 변환 객체)<br>RecipeGroupModel, RecipeVersionModel"]
        Database["Database (SQLite)"]
    end

    %% 의존성 및 데이터 흐름 정의
    View -- "사용자 입력 전달" --> ViewModel
    ViewModel -- "1. UseCase 호출" --> UseCase
    
    UseCase -- "2. Repository 규칙 호출" --> RepositoryInterface
    RepositoryInterface -- "순수 Entity 사용" --> Entities

    RepositoryInterface <|-- "규칙(Interface) 구현" --o RepositoryImpl
    RepositoryImpl -- "3. DataSource에 데이터 요청" --> DataSource
    RepositoryImpl -- "Model을 Entity로 변환" --> Models
    
    DataSource -- "4. DB에 SQL 쿼리 실행" --> Database
    Database -- "Raw Data (Map) 반환" --> DataSource
    DataSource -- "Model 객체로 변환 후 반환" --> RepositoryImpl
    
    %% 스타일 정의
    classDef presentation fill:#D6EAF8,stroke:#5DADE2,stroke-width:2px
    classDef domain fill:#D5F5E3,stroke:#58D68D,stroke-width:2px
    classDef data fill:#FDEDEC,stroke:#F1948A,stroke-width:2px
    
    class View,ViewModel presentation
    class UseCase,RepositoryInterface,Entities domain
    class RepositoryImpl,DataSource,Models,Database data