package com.linksharing

class Resource {
    String description
    User createdBy
    Topic topic
    Date dateCreated
    Date lastUpdated

    Resource(String description, User createdBy, Topic topic, Date dateCreated, Date lastUpdated) {
        super()
        this.description = description
        this.createdBy = createdBy
        this.topic = topic
        this.dateCreated = dateCreated
        this.lastUpdated = lastUpdated
    }
    static belongsTo = [topic:Topic, createdBy:User]
    static hasMany = [readingItem:ReadingItem]


    static constraints = {
        description blank: false,nullable: true
        createdBy blank: false,nullable: true
        topic blank: false, nullable: true
        dateCreated nullable: true
        lastUpdated nullable: true

    }

    static mapping = {
        tablePerHierarchy false
    }
}
