package com.linksharing

import CO.TopicCo
import grails.plugin.springsecurity.annotation.Secured

class TopicController {

    def topicService
    def springSecurityService
    @Secured('permitAll')
    def index() { }

    // @Secured(['ROLE_USER','ROLE_ADMIN'])
    @Secured("permitAll")
    def createTopic(TopicCo topicCo){
        User user=springSecurityService.currentUser
        String s=topicService.createNewTopic(topicCo,user.username)
         render s
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
        render (view: '/topicController/TopicInfo',model: [list:listTopics])
    }


    def updateTopics(Integer id){

    }

    def deleteTopics(Integer id) {
        Topic.get(id).delete()
        return "Successfully deleted"
    }

    @Secured('permitAll')
    def printAjax(){
        println("..........................." + params.param1)
        render(template: "/topicController/example" ,model: [num: params.param1])

    }
}
