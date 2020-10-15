package com.example.supercatapp.adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.example.supercatapp.R
import com.example.supercatapp.models.Pet
import com.squareup.picasso.OkHttp3Downloader
import com.squareup.picasso.Picasso
import kotlinx.android.synthetic.main.prototype_pet.view.*

class PetAdapter (val pets: List<Pet>, val context: Context, val itemClickListener: OnItemClickListener): RecyclerView.Adapter<PetAdapter.ViewHolder>(){
    class ViewHolder(val view: View): RecyclerView.ViewHolder(view){
        val ivPet = view.ivPet
        val tvName = view.tvName
        val cvPet = view.cvPet
    }

    interface OnItemClickListener{
        fun onItemClicked(pet: Pet)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ViewHolder {
        val view = LayoutInflater.from(context)
            .inflate(R.layout.prototype_pet, parent, false)
        return ViewHolder(view)
    }

    override fun getItemCount(): Int {
        return pets.size
    }

    override fun onBindViewHolder(holder: ViewHolder, position: Int) {
        val pet = pets[position]
        holder.tvName.text = pet.PetId.toString()

        val picBuilder = Picasso.Builder(context)
        picBuilder.downloader(OkHttp3Downloader(context))
        picBuilder.build().load(pet.image).into(holder.ivPet)

        holder.cvPet.setOnClickListener{
            itemClickListener.onItemClicked(pet)
        }
    }

}