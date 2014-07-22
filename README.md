# Slurm Dashing's Dashboard

## Description

![](https://raw.githubusercontent.com/julcollas/dashing-slurm/master/screenshots/board.png)

Slurm [dashing](http://shopify.github.com/dashing) dashboard to monitor [slurm](http://slurm.schedmd.com) jobs, partition and users activities with [slurmmon-graphite](http://ToDo)


## Dependencies

Add them to dashing's gemfile:

	gem 'rest-client'
	gem 'json'

and run `bundle install`.

## Usage

To use this dashboard, copy all the files into their respectives folders.

Then include the desired widget in a dashboard, by adding the following snippet to your dashboard layout file:

* For the scheduled jobs heatmap widget
```html
    <li data-row="1" data-col="2" data-sizex="1" data-sizey="1">
      <div data-id="slurmmon.slurm-1.jobcount.total_pending" data-title="Pending" data-view="Number" style="background-color:#ff9618;" ></div>
    </li>
```