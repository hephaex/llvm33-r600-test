extern "C" int blockIdx_x();
extern "C" int blockDim_x();
extern "C" int threadIdx_x();

void
kernel(__attribute__((address_space(1))) float *__restrict__ c,
       __attribute__((address_space(1))) const float *__restrict__ a,
       __attribute__((address_space(1))) const float *__restrict__ b)
{
  struct {
    int x, y, z;
  } blockIdx, blockDim, threadIdx;
  blockIdx.x = blockIdx_x();
  blockDim.x = blockDim_x();
  threadIdx.x = threadIdx_x();

  int i = blockIdx.x * blockDim.x + threadIdx.x;
  c[i] = a[i] + b[i];
}
