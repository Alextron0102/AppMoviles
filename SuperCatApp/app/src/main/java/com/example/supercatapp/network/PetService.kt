package com.example.supercatapp.network

import com.example.supercatapp.models.ApiResponseHeader
import retrofit2.http.GET
import retrofit2.http.Header
import retrofit2.Call

interface PetService {
    @GET
    fun getPets(@Header("x-api-key")apiKey: String):Call<ApiResponseHeader>
}