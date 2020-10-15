package com.example.supercatapp.models

import com.google.gson.annotations.SerializedName

class ApiResponseDetails (
    @SerializedName("results")
    val results: Int,
    @SerializedName("pets")
    val pets: List<Pet>
)