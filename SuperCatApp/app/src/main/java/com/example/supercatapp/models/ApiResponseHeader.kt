package com.example.supercatapp.models

import com.google.gson.annotations.SerializedName

class ApiResponseHeader (
    @SerializedName("api")
    var api: ApiResponseDetails
)