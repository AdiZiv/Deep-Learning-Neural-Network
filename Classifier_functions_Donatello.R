ID <- c(204025803, 304962475)

TrainModel <- function(X, y)
{
  
  # Input image dimensions
  img_rows <- 28
  img_cols <- 28
  input_shape <- c(img_rows, img_cols, 1)
  
  y <- to_categorical(y)
  X <- array_reshape(X, c(nrow(X), img_rows, img_cols, 1))
  
  # Define Model -----------------------------------------------------------
  
  model <- keras_model_sequential()
  model %>%
    layer_conv_2d(filters = 32, kernel_size = c(5,5), activation = 'relu',
                  input_shape = input_shape) %>% 
    layer_max_pooling_2d(pool_size = c(2, 2)) %>% 
        layer_conv_2d(filters = 64, kernel_size = c(3,3), activation = 'relu') %>% 
    layer_max_pooling_2d(pool_size = c(2, 2)) %>% 
    layer_dropout(rate = 0.25) %>% 
    layer_flatten() %>% 
    layer_dense(units = 128, activation = 'relu') %>% 
    layer_dropout(rate = 0.5) %>% 
    layer_dense(units = 10, activation = 'softmax')
  
  # Compile model ---------------------------------------------------------
  
  model %>% compile(
    loss = loss_categorical_crossentropy,
    optimizer = optimizer_adam(),
    metrics = c('accuracy')
  )

    # Train ----------------------------------------------------------------
  start <- proc.time()
  model %>% fit(
    X, y,
    batch_size = 150,
    epochs = 12
  )
  round(proc.time()-start,2)[3]
  
  
  return(model)
}
  
# predict labels for test set using learned parameters w   
PredictModel <- function(X, model)
{
  X <- array_reshape(X, c(nrow(X), 28, 28, 1))

    return(model %>% predict_classes(X))
}

