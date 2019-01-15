package com.linksharing

class ReadingItem {

    Resource resource
    User user
    Boolean isRead

    ReadingItem(Resource resource, User user, Boolean isRead) {
        super()
        this.resource = resource
        this.user = user
        this.isRead = isRead
    }
    static belongsTo = [user:User, resource:Resource]

    static constraints = {
        resource blank: false, nullable: false
        user blank: false,nullable: false
        isRead blank: false, nullable: false
    }
}
