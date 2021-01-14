**Application**

[Flexget website](http://flexget.com/)

**Description Flexget with webui daemon**

FlexGet is a multipurpose automation tool for content like torrents, nzbs, podcasts, comics, series, movies, etc. It can use different kinds of sources like RSS-feeds, html pages, csv files, search engines and there are even plugins for sites that do not provide any kind of useful feeds.  There are numerous plugins that allow utilizing FlexGet in interesting ways and more are being added continuously.  FlexGet is extremely useful in conjunction with applications which have watch directory support or provide interface for external utilities like FlexGet.

**Access Flexget-webui** [default password is flex12345678]

 Change passord with:   

    docker exec -it paulpoco-arch-fletget /bin/bash
    flexget web passwd <some_password>  #from inside container

`http://<host ip>:3539`

**Build notes**

Latest stable Flexget release from Python.
