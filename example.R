suppressMessages(library(datateachr))
suppressMessages(library(tidyverse))
suppressMessages(library(ggpmisc))
suppressMessages(library(ggplot2))
suppressMessages(library(GGally))
suppressMessages(library(psych))
suppressMessages(library(dplyr))
suppressMessages(library(testthat))
suppressMessages(library(gapminder))


#' Make histogram plots
#'
#' This function make the histogram plots for a certain variable in different groups/levels seperately.
#' 
#'  @params data. The dataset needed to be explored; It was named "data" because it is the dataset on which we want to do explortoray analysis
#'  @params group. The variable in dataset that we want to group by. It was named "group" because we want to group_by this variable.
#'  @params variable. The certain variable that we want to make histogram plots in different groups/levels. It was named "variable" because it is the variable that we want to make histograms for.
#'  @params x_label. The x_label for the plots. It was named "x_label" because it it necessary to label the name of the variable that we would like to plot whereas the y_label count is fixed for histogram plots.
#'  @return The output is several histogram plots for the certain variable in each group level. The number of plots should be equal to the dimension of the groups/levels.
#'  @details The function was made by combining "group_by", "mutate", and "ggplot" functions
#'  @examples
#'  histogram_plot(cancer_sample,diagnosis,radius_mean,"radius_mean")
#'  histogram_plot(gapminder,continent,lifeExp,"lifeExp")
#'  
#'  # Here is a special case:
#'  histogram_plot()
#'  @export
histogram_plot<-function(data, group,variable, x_label){
  data_plot<-data %>% 
    group_by({{group}}) %>% 
    nest() %>% 
    mutate(plot = map2(data,{{group}}, ~ ggplot(data = .x, aes(x = {{variable}})) +geom_histogram(alpha=0.5,bins=30)+ 
                         labs(x = x_label,
                              y = 'count') + 
                         ggtitle(glue::glue("Histogram plots for ", {x_label}, " in Group ", {.y}))))
  data_plot$plot}
