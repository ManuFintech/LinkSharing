package CO

import grails.validation.Validateable

class TopicCo implements Validateable{
    String name
    Enums.Visibility visibility

    static constraints = {
        name blank:true,nullable:true
        visibility blank: true,nullable: true


    }
}
