package com.example.supercatapp.controller.fragments

import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.example.supercatapp.R
import com.example.supercatapp.adapter.PetAdapter
import com.example.supercatapp.database.PetDB
import com.example.supercatapp.models.Pet
import kotlinx.android.synthetic.main.fragment_save.view.*

class SaveFragment : Fragment(), PetAdapter.OnItemClickListener {
    var pet: List<Pet> = ArrayList()
    lateinit var recyclerView: RecyclerView

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        return inflater.inflate(R.layout.fragment_save, container, false)
    }

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)
        pet = PetDB.getInstance(view.context).getPetDAO().getAllPets()
        recyclerView = view.rvPetsSave
        recyclerView.layoutManager = LinearLayoutManager(context)
        recyclerView.adapter = PetAdapter(pet, view.context, this)
    }

    override fun onItemClicked(pet: Pet) {
        TODO("Not yet implemented")
    }
}