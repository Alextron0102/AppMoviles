package com.example.appsearchjob

import android.text.Html
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.bumptech.glide.Glide
import kotlinx.android.synthetic.main.prototype_job.view.*

class JobAdapter(val jobs:List<Job>) : RecyclerView.Adapter<JobPrototype>() {
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): JobPrototype {
        val view = LayoutInflater
            .from(parent.context)
            .inflate(R.layout.prototype_job, parent,false   )
        return JobPrototype(view)
    }

    override fun getItemCount(): Int {
        return jobs.size
    }

    override fun onBindViewHolder(prototype: JobPrototype, position: Int) {
        prototype.bind(jobs[position])
    }


}

class JobPrototype(itemView: View) : RecyclerView.ViewHolder(itemView) {
    val tvTitle = itemView.tvTitle
    val tvDescription = itemView.tvDescription
    val tvCompany = itemView.tvCompany
    val ivLogo = itemView.ivLogo
    fun bind(job: Job){
        tvCompany.text = job.company
        tvTitle.text = job.title
        tvDescription.text = Html.fromHtml(job.description,1)
        //carga de la imagen:
        Glide.with(itemView).load(job.companyLogo).into(ivLogo)
    }
}
