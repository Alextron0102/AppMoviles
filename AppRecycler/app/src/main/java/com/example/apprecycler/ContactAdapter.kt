package com.example.apprecycler

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import androidx.recyclerview.widget.RecyclerView
import kotlinx.android.synthetic.main.prototype_contact.view.*

class ContactAdapter(val mcontext: Context, var contacts: ArrayList<Contact>): RecyclerView.Adapter<ContactPrototype>() {
    val REQUEST_CODE = 1
    //Crear el prototipe (ViewHolder) para cada elemento/fila
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): ContactPrototype {
        val view = LayoutInflater
            .from(parent.context)
            .inflate(R.layout.prototype_contact, parent, false)
        return ContactPrototype(view)
    }

    //tamaño del array
    override fun getItemCount(): Int {
        return contacts.size
    }
    //Conecta la informacion con la vista
    override fun onBindViewHolder(contactPrototype: ContactPrototype, position: Int) {
        contactPrototype.bind(contacts.get(position))
        contactPrototype.itemView.ibtRemove.setOnClickListener{
            Toast.makeText(mcontext, "Eliminado " + contacts[position].name, Toast.LENGTH_SHORT).show()
            contacts.removeAt(position)
            notifyDataSetChanged()
        }
        contactPrototype.itemView.ibtEdit.setOnClickListener {
            val intent = Intent(mcontext ,ContactActivity::class.java)
            intent.putExtra("name",contacts[position].name)
            intent.putExtra("telephone",contacts[position].telephone)
            intent.putExtra("position",position.toString())
            (mcontext as Activity).startActivityForResult(intent,1)
        }
    }

}

class ContactPrototype(itemView: View) : RecyclerView.ViewHolder(itemView) {
    val tvName = itemView.tvName
    val tvTelephone = itemView.etTelephone
    fun bind(contact: Contact){
        tvName.text = contact.name
        tvTelephone.text = contact.telephone
    }
}
