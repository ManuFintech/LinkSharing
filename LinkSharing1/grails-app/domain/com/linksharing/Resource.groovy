package com.linksharing

class Resource {
    String fileName
    String description
    User createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated

    Resource(String fileName,String description, User createdBy, Topic topic, Date dateCreated, Date lastUpdated) {
        super()
        this.fileName=fileName
        this.description = description
        this.createdBy = createdBy
        this.topic = topic
        this.dateCreated = dateCreated
        this.lastUpdated = lastUpdated
    }
    static belongsTo = [topic:Topic, createdBy:User]
    static hasMany = [readingItem:ReadingItem]


    static constraints = {
        description blank: false,nullable: false
        createdBy blank: false,nullable: false
        topic blank: false, nullable: false
        dateCreated blank: false, nullable: false
        lastUpdated blank: false, nullable: false

    }

    static mapping = {
        tablePerHierarchy false
    }
}
