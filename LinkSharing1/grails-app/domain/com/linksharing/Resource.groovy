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
        description blank: false,nullable: false
        createdBy blank: false,nullable: false
        topic blank: false, nullable: false
        dateCreated nullable: true
        lastUpdated nullable: true

    }

    static mapping = {
        tablePerHierarchy false
    }
}
