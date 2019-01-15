package Enums

enum Visibility {
    PUBLIC("Public"),
    PRIVATE("Private")

    String value;

    Visibility(String value){
        this.value=value
    }

    String getValue(){
        return value
    }

}