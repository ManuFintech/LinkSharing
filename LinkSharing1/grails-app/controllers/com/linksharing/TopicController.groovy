package com.linksharing

import CO.TopicCo
import grails.plugin.springsecurity.annotation.Secured

class TopicController {

    def topicService
    def springSecurityService

    @Secured('permitAll')
    def index() {}

    // @Secured(['ROLE_USER','ROLE_ADMIN'])
    @Secured("permitAll")
    def createTopic(TopicCo topicCo) {
        println("tttttttttttttttttttttttttttttttttttt"+topicCo.topic+" "+topicCo.visibility)
        User user = springSecurityService.currentUser
        String s = topicService.createNewTopic(topicCo, user.username)
        render s
    }

    @Secured("permitAll")
    def getTopic(Integer id) {
        Topic topic = topicService.topic(id)
        def map = [name: topic.name, visibility: topic.visibility, createdBy: [email: topic.createdBy.email]]
        render(view: "/topicController/TopicInfo", model: [topic: map])

    }

    @Secured("permitAll")
    def getTopics() {

        def returnedMap = topicService.topics()
        List<Subscription> subscribedList = returnedMap.get("subscribedByUser")
        println("ooooooooooooooooooooooooooo" + subscribedList)
        List<Topic> unsubscribedList = returnedMap.get("unsubcribedToUser")
        println("::::::::::::::::" + unsubscribedList)
        render(view: '/topicController/TopicInfo', model: [subscribedList: subscribedList, unsubscribedList: unsubscribedList])

    }


    def updateTopics(Integer id) {

    }

    def deleteTopics(Integer id) {
        Topic.get(id).delete()
        return "Successfully deleted"
    }

    @Secured("permitAll")
    def getAllTopics(){
        List<Topic> allTopics=topicService.allTopics()
        render(view: "/linkResourceController/shareLink",model: [allTopics: allTopics])

    }




}
