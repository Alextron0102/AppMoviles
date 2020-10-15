package com.example.supercatapp.database

import androidx.room.*
import com.example.supercatapp.models.Pet

@Dao
interface PetDAO{
    @Insert
    fun insertPet(vararg pet: Pet)

    @Query("SELECT * FROM pets")
    fun getAllPets():List<Pet>

    @Delete
    fun deletePets(vararg pet:Pet)

    @Update
    fun updatePets(vararg pet: Pet)
}