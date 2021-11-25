library(tidyverse)
library(tidytuesdayR)
tuesdata <- tidytuesdayR::tt_load('2021-11-23')
tuesdata$episodes->episodes
library(png)


glimpse(episodes)


episodes%>%
  select(type,rating, episode_title,uk_viewers)%>%
  filter(type=="special")->data

ggplot(data,aes(x=rating,y=uk_viewers,label=episode_title))+
  geom_hline(yintercept=0, 
             color = "#422D53")+
  geom_segment(aes(y=uk_viewers,yend=0,xend=rating), size=1.2,color="#6650c0")+
  geom_point(aes(y=uk_viewers, size=uk_viewers),alpha=0.9,pch=23,fill="#b13850",colour="white")+
  scale_x_continuous(limits = c(79,89),breaks=c(79,81,84,87,89))+
  annotate(geom = "text", x = 86.4, y = 14.5, label = "Voyage of the Damned", hjust = "right",colour="white")+
  annotate(geom = "text", x = 86, y = 14, label = " The Next Doctor", hjust = "right",colour="white")+
  annotate(geom = "text", x = 87.5, y = 13.8, label = "The Day of the Doctor", hjust = "left",colour="white")+
  scale_y_continuous(limits=c(0,15),breaks=c(5,10,15))+
  scale_size_continuous(limits = c(6,14))+
  theme(
    plot.background = element_rect(fill="black"),
    panel.background = element_rect(fill="black"),
    legend.background = element_rect(fill="black"),
    plot.margin = unit(c(1,2,1,2),"cm"),
    axis.text.x = element_text(colour="#d6c0ce",size=10,face="bold"),
    axis.text.y = element_text(colour="#d6c0ce",size=10,face="bold"),
    axis.ticks = element_blank(),
    axis.line.y = element_line(colour="#422D53"),
    panel.grid=element_blank(),
    legend.position = "none",
    axis.title.x = element_text(colour="white",size=10, face="bold",margin=margin(t=15)),
    axis.title.y = element_text(colour="white",size=10, face="bold",margin=margin(r=15)),
    plot.title.position = "plot",
    plot.caption.position = "plot",
    plot.title=element_text(size=14, face="bold",colour="#fcf5f2",margin=margin(b=15)),
    plot.subtitle = element_text(size=12, colour="#fcf5f2",margin=margin(b=25)),
    plot.caption=element_text(size=10,colour="#fcf5f2",hjust=0,margin=margin(t=20)))+
  labs(title="DOCTOR WHO SPECIALS",
       subtitle="Voyage of the Damned and The Next Doctor are the Specials with the highest number of viewers in the UK",
       caption = "Data via Tidy Tuesday| Analysis and design: @annapurani93",
       size = "Number of Viewers (in million)"
  )+
  ylab("------------Number of Viewers (in million)------------")+
  xlab("------------------------Ratings------------------------")->plot


logo <- readPNG("C:/Users/Annapurani/Desktop/Doctor_Who_-_Current_Titlecard.png")
ggdraw(plot) +
  draw_image(logo, x = +0.39, y =+0.4, scale = 0.15)->plot1

ggsave("doctorwhotimeline.png",plot1,width=12,height=7.5)

