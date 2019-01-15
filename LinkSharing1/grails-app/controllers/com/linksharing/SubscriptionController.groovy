package com.linksharing

class SubscriptionController {

    def subscriptionService

    def index() { }


    def  createSubscription(Topic topic,User user,Enums.Seriousness seriousness){
        render subscriptionService.subscribe(topic,user,seriousness)
    }

    def getSubscription(Integer id){
        render subscriptionService.subscriber(id)
    }

    def getSubscriptions(){
        render subscriptionService.allSubscription()
    }

    def updateSubscriptions(){

    }

    def deleteSubscriptions(Integer id){
        subscriptionService.deleteSubscription(id)
    }
}
