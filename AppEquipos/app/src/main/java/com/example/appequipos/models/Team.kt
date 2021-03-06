package com.example.appequipos.models

import androidx.room.Entity
import androidx.room.PrimaryKey
import com.google.gson.annotations.SerializedName
import java.io.Serializable
@Entity(tableName = "Teams")
class Team (
    @PrimaryKey
    @SerializedName("team_id")
    val teamId: Int=0,
    @SerializedName("name")
    val name: String,
    @SerializedName("logo")
    val logo: String,
    @SerializedName("venue_name")
    val venue: String
): Serializable