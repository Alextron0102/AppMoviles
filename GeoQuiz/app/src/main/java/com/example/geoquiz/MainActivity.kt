package com.example.geoquiz

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.Toast
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity() {
    //lateinit es para crear la variable en tiempo de ejecucion
    lateinit var questions: ArrayList<Question>
    var position = 0
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        loadQuestions()
        setupViews()
        showSentence()
    }

    fun loadQuestions() {
        questions = ArrayList()
        questions.add(Question("Es Santiago capital de Brasil",false))
        questions.add(Question("Es Cuba capital de Brasil",false))
        questions.add(Question("Es Buenos Aires capital de Argentina",true))
    }
    fun showSentence(){
        tvSentence.text = questions[position].sentence
    }
    fun passSentence(){
        if(position < questions.size-1)
            position++
        else position = 0
        showSentence()
    }
    fun setupViews() {
        //1ra forma de referenciar --> java
        //val btYes = findViewById<Button>(R.id.btYes)
        //2da forma: (directamente usar btYes
        btYes.setOnClickListener {
            if(questions[position].answer)
                //Toast.makeText(this, "Correcto", Toast.LENGTH_LONG).show()
                Toast.makeText(this, "Correcto", Toast.LENGTH_SHORT).show()
            else
                Toast.makeText(this, "Incorrecto", Toast.LENGTH_SHORT).show()
            passSentence()
        }
        btNo.setOnClickListener {
            if(!questions[position].answer)
                Toast.makeText(this, "Correcto", Toast.LENGTH_SHORT).show()
            else
                Toast.makeText(this, "Incorrecto", Toast.LENGTH_SHORT).show()
            passSentence()
        }
        btNext.setOnClickListener{
            passSentence()
        }
    }
}