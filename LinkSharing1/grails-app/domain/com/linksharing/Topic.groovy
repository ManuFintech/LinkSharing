package com.linksharing

class Topic {

    String name
    User createdBy
    Date dateCreated
    Date lastUpdated
    Enums.Visibility visibility = Enums.Visibility.PUBLIC

    Topic(String name, Enums.Visibility visibility,User createdBy) {
        this.name = name
        this.visibility = visibility
        this.createdBy=createdBy
    }
    static belongsTo = [createdBy:User]
    static hasMany = [subscription:Subscription,resource:Resource]

    static constraints = {
        name blank: true,nullable: true
        createdBy blank: true, nullable: true
        visibility blank: true, nullable: true

    }
}
