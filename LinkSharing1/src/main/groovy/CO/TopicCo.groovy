package CO

import grails.validation.Validateable

class TopicCo implements Validateable{

    String topic
    Enums.Visibility visibility

    static constraints = {
        topic blank:true,nullable:true
        visibility blank: true,nullable: true


    }
}
