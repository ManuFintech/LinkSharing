package com.linksharing

class Subscription {

    Topic topic
    User user
    Seriousness seriousness
    Date dateCreated

    Subscription(id, Topic topic, User user, Seriousness seriousness) {
        super()
        this.id = id
        this.topic = topic
        this.user = user
        this.seriousness = seriousness

    }
    static belongsTo = [user:User, topic:Topic]


    static constraints = {
        topic blank: false, nullable: false
        user blank: false, nullable: false
        seriousness blank: false, nullable: false
        dateCreated blank: false,nullable: false
    }
}
