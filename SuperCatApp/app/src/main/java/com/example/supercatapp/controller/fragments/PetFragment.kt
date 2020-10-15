package com.example.supercatapp.controller.fragments

import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.text.Layout
import android.util.Log
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.supercatapp.R
import com.example.supercatapp.adapter.PetAdapter
import com.example.supercatapp.models.ApiResponseHeader
import com.example.supercatapp.models.Pet
import com.example.supercatapp.network.PetService
import kotlinx.android.synthetic.main.fragment_pet.*
import retrofit2.Call
import retrofit2.Callback
import retrofit2.Response
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory


class PetFragment : Fragment(), PetAdapter.OnItemClickListener {
    var pet: List<Pet> = ArrayList()
    lateinit var recyclerView: RecyclerView

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View? {
        return inflater.inflate(R.layout.fragment_pet,container,false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        recyclerView = rvPets
        loadPets(view.context)
    }

    private fun loadPets(context: Context) {
        val retrofit = Retrofit.Builder()
            .baseUrl("https://api.thecatapi.com/v1/images/search?limit=100")
            .addConverterFactory(GsonConverterFactory.create())
            .build()

        val petService: PetService
        petService = retrofit.create(PetService::class.java)

        val request = petService.getPets("8ed1a368-130e-479b-a882-2026c94b4a64")

        request.enqueue(object : Callback<ApiResponseHeader> {

            override fun onFailure(call: Call<ApiResponseHeader>, t: Throwable) {
                Log.d("Activity Fail", "Error: "+t.toString())
            }

            override fun onResponse(call: Call<ApiResponseHeader>, responseDetails: Response<ApiResponseHeader>) {
                if (responseDetails.isSuccessful) {
                    val pets: List<Pet> = responseDetails.body()!!.api.pets ?: ArrayList()
                    recyclerView.layoutManager = LinearLayoutManager(context)
                    recyclerView.adapter = PetAdapter(pets, context, this@PetFragment)
                }

                else{
                    Log.d("Activity Fail", "Error: "+responseDetails.code())
                }
            }
        })
    }

    override fun onItemClicked(pet: Pet) {
        //Aqui tenemos que añadir el pet a la lista de pets preferidos
    }
}