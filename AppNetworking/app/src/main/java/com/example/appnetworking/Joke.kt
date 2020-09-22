package com.example.appnetworking

import com.google.gson.annotations.SerializedName

class Joke (
    @SerializedName("joke")
    val joke: String
)