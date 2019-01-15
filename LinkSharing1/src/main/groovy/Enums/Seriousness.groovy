package Enums

enum Seriousness {
    SERIOUS("Serious"),
    VERYSERIOUS("Very Serious"),
    CASUAL("Casual")

    String value

    Seriousness(String value){
        this.value=value
    }

    String getValue(){
        return value
    }

}