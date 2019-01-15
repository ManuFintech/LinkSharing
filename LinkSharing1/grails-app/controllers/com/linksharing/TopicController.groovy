package com.linksharing

import CO.TopicCo
import grails.plugin.springsecurity.annotation.Secured

class TopicController {

    def topicService
    def springSecurityService

    def index() { }

    // @Secured(['ROLE_USER','ROLE_ADMIN'])
    @Secured("permitAll")
    def createTopic(TopicCo topicCo){
//        if(isLoggedIn()){
//            println("<<<<<<<<<<<<<<<<<<<<<<<<<"+principal.username)
//        }else{
//            println(">>>>>>>>>>>>>>>>>>>>>>>>> failed")
//        }
        //println(springSecurityService.currentUser)
        //println("//////////////////////////"+user.username)
        String s=topicService.createNewTopic(topicCo,userName)
        // render s
    }

    @Secured("permitAll")
    def getTopic( Integer id){
        Topic topic=topicService.topic(id)
        def map=[name:topic.name,visibility:topic.visibility,createdBy:[email:topic.createdBy.email]]
        render(view:"/topicController/TopicInfo",model:[topic:map])

    }

    @Secured("permitAll")
    def getTopics(){
        List<Topic> listTopics=topicService.topics()
        render listTopics
    }


    def updateTopics(Integer id){

    }

    def deleteTopics(Integer id) {
        Person.get(id).delete()
        return "Successfully deleted"
    }
}
