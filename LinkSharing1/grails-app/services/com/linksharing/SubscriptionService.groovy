package com.linksharing

import Enums.Seriousness
import grails.gorm.transactions.Transactional

@Transactional
class SubscriptionService {
    def springSecurityService

    def serviceMethod() {

    }
    Subscription subscribe(def param1,Seriousness param2){
        User user=springSecurityService.currentUser
        println("::::::::::::::::::::::"+param1+" "+param2)
        Topic topic = Topic.findById(param1)
        println("<<<<<<<<<<<<<<<<<<<"+topic.name+" "+topic.createdBy.id)
        Subscription subscription=new Subscription(topic,user,param2)
        println("ssssssssssssssssssssssssssss"+subscription.id+" "+subscription.topic.id+" "+user.id)
        subscription.save(flush:true)
//        if(!subscription.save(flush:true)){
//           subscription.errors.allErrors.each {
//               println it
//           }
//            return 'Failed'
//        }else{
//            return 'Success'
//        }
        return subscription

    }

    Subscription subscriber(Integer id){
        def query=Subscription.where{
            id==id
        }

        Subscription subscription=query.find()
        return subscription
    }

    List<Subscription> allSubscription(){
        List<Subscription> lists=Subscription.findAll()
        return lists
    }

        def deleteSubscription(def id){
        User user=springSecurityService.currentUser
        println("Hit is coming......................."+id)
        def topic=Topic.findById(id)
        println("qqqqqqqqqqqqqqqqqqqqqqqqq"+topic.id+" "+user.id)
        Subscription subscription=Subscription.findByTopicAndUser(topic,user)
        println("+++++++++++++++++++++++"+subscription)
        if(!subscription.delete(flush: true)){
            subscription.errors.allErrors.each{
                println it
            }
        }else {
            println "Success"
        }


    }
}
