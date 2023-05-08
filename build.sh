# build script on FAU
# user b154dc22

source $HOME/.bashrc

mkdir ~/QE  
cd ~/QE  
export BIN_PATH=$PWD

wget --no-check-certificate https://www.quantum-espresso.org/rdm-download/488/v7-1/ed38286b6e96615332204a07e1912696/qe-7.1-ReleasePack.tar.gz

tar xfp qe-7.1-ReleasePack.tar.gz  
cd qe-7.1  

module purge
module load intel/2021.7.0
module load mkl/2022.2.1 m4/1.4.19
module load git/2.38.1
module load intelmpi/2021.7.1

export I_MPI_CC=icc
export I_MPI_CXX=icpc
export I_MPI_FC=ifort
export I_MPI_F90=ifort

COMP="CC=mpiicc CXX=mpiicpc FC=mpiifort F90=mpiifort MPIF90=mpiifort"
SCA="--with-scalapack=intel" 

export IPM_REPORT=full
export IPM_LOG=full
export IPM_STATS=all
export IPM_LOGWRITER=serial

./configure CFLAGS="-fast" --enable-parallel --prefix=$BIN_PATH --enable-openmp $SCA $COMP  
make -j 32 cp pw  
make install  

cd ~/QE
git clone https://github.com/trkk28097402/ISC23-qe.git
cd ISC23-qe
export TESTCASE_PATH=$PWD
unzip CP-W256.zip 
unzip supercell_11layer.zip