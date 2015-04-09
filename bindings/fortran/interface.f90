! Chemharp, an efficient IO library for chemistry file formats
! Copyright (C) 2015 Guillaume Fraux
!
! This Source Code Form is subject to the terms of the Mozilla Public
! License, v. 2.0. If a copy of the MPL was not distributed with this
! file, You can obtain one at http://mozilla.org/MPL/2.0/
!
! =========================================================================== !
! !!!! AUTO-GENERATED FILE !!!! Do not edit. See scripts/fortran for the code.
! This file contains Fortran 2003 ISO C Binding interface to the C API
!
! This file is not compilable on his own, but should be 'include'd in another
! fortran compilation unit.
! =========================================================================== !


function chrp_strerror(status) result(string)
    implicit none
    integer(kind=c_int) :: status
    character, pointer, dimension(:) :: string
    type(c_ptr) :: c_string

    c_string = chrp_strerror_c(status)
    call c_f_pointer(c_string, string, [1])
end function

function chrp_last_error() result(string)
    implicit none

    character, pointer, dimension(:) :: string
    type(c_ptr) :: c_string

    c_string = chrp_last_error_c()
    call c_f_pointer(c_string, string, [1])
end function

subroutine chrp_loglevel(level, status)
    implicit none
    include "cenums.f90"
    integer(kind(log_level)) :: level
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_loglevel_c(level)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_logfile(file, status)
    implicit none
    character(len=*), intent(in) :: file
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_logfile_c(file)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_log_stderr(status)
    implicit none

    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_log_stderr_c()
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_open(this, filename, mode)
    implicit none
    class(trajectory) :: this
    character(len=*), intent(in) :: filename
    character(len=*), intent(in) :: mode

    this%ptr = chrp_open_c(filename, mode)
end subroutine

subroutine chrp_read_step(this, step, frame_, status)
    implicit none
    class(trajectory) :: this
    integer(kind=c_size_t) :: step
    class(frame), intent(in) :: frame_
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_read_step_c(this%ptr, step, frame_%ptr)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_read_next_step(this, frame_, status)
    implicit none
    class(trajectory) :: this
    class(frame), intent(in) :: frame_
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_read_next_step_c(this%ptr, frame_%ptr)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_write_step(this, frame_, status)
    implicit none
    class(trajectory) :: this
    class(frame), intent(in) :: frame_
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_write_step_c(this%ptr, frame_%ptr)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_close(this, status)
    implicit none
    class(trajectory) :: this
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_close_c(this%ptr)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_frame(this, natoms)
    implicit none
    class(frame) :: this
    integer(kind=c_size_t) :: natoms

    this%ptr = chrp_frame_c(natoms)
end subroutine

subroutine chrp_frame_size(this, natoms, status)
    implicit none
    class(frame), intent(in) :: this
    integer(kind=c_size_t) :: natoms
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_frame_size_c(this%ptr, natoms)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_frame_positions(this, data, size, status)
    implicit none
    class(frame), intent(in) :: this
    real(kind=c_float), dimension(:, :) :: data
    integer(kind=c_size_t) :: size
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_frame_positions_c(this%ptr, data, size)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_frame_positions_set(this, data, size, status)
    implicit none
    class(frame) :: this
    real(kind=c_float), dimension(:, :) :: data
    integer(kind=c_size_t) :: size
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_frame_positions_set_c(this%ptr, data, size)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_frame_velocities(this, data, size, status)
    implicit none
    class(frame), intent(in) :: this
    real(kind=c_float), dimension(:, :) :: data
    integer(kind=c_size_t) :: size
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_frame_velocities_c(this%ptr, data, size)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_frame_velocities_set(this, data, size, status)
    implicit none
    class(frame) :: this
    real(kind=c_float), dimension(:, :) :: data
    integer(kind=c_size_t) :: size
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_frame_velocities_set_c(this%ptr, data, size)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_frame_free(this, status)
    implicit none
    class(frame) :: this
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_frame_free_c(this%ptr)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_cell(this, frame_)
    implicit none
    class(cell) :: this
    class(frame) :: frame_

    this%ptr = chrp_cell_c(frame_%ptr)
end subroutine

subroutine chrp_cell_lengths(this, a, b, c, status)
    implicit none
    class(cell), intent(in) :: this
    real(kind=c_double) :: a
    real(kind=c_double) :: b
    real(kind=c_double) :: c
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_cell_lengths_c(this%ptr, a, b, c)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_cell_lengths_set(this, a, b, c, status)
    implicit none
    class(cell) :: this
    real(kind=c_double) :: a
    real(kind=c_double) :: b
    real(kind=c_double) :: c
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_cell_lengths_set_c(this%ptr, a, b, c)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_cell_angles(this, alpha, beta, gamma, status)
    implicit none
    class(cell), intent(in) :: this
    real(kind=c_double) :: alpha
    real(kind=c_double) :: beta
    real(kind=c_double) :: gamma
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_cell_angles_c(this%ptr, alpha, beta, gamma)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_cell_angles_set(this, alpha, beta, gamma, status)
    implicit none
    class(cell) :: this
    real(kind=c_double) :: alpha
    real(kind=c_double) :: beta
    real(kind=c_double) :: gamma
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_cell_angles_set_c(this%ptr, alpha, beta, gamma)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_cell_matrix(this, mat, status)
    implicit none
    class(cell), intent(in) :: this
    real(kind=c_double), dimension(3, 3) :: mat
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_cell_matrix_c(this%ptr, mat)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_cell_type(this, type, status)
    implicit none
    class(cell), intent(in) :: this
    include "cenums.f90"
    integer(kind(cell_type)) :: type
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_cell_type_c(this%ptr, type)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_cell_type_set(this, type, status)
    implicit none
    class(cell) :: this
    include "cenums.f90"
    integer(kind(cell_type)) :: type
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_cell_type_set_c(this%ptr, type)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_cell_periodicity(this, x, y, z, status)
    implicit none
    class(cell), intent(in) :: this
    logical(kind=c_bool) :: x
    logical(kind=c_bool) :: y
    logical(kind=c_bool) :: z
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_cell_periodicity_c(this%ptr, x, y, z)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_cell_periodicity_set(this, x, y, z, status)
    implicit none
    class(cell) :: this
    logical(kind=c_bool) :: x
    logical(kind=c_bool) :: y
    logical(kind=c_bool) :: z
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_cell_periodicity_set_c(this%ptr, x, y, z)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_cell_free(this, status)
    implicit none
    class(cell) :: this
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_cell_free_c(this%ptr)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_topology(this, frame_)
    implicit none
    class(topology) :: this
    class(frame) :: frame_

    this%ptr = chrp_topology_c(frame_%ptr)
end subroutine

subroutine chrp_topology_append(this, atom_, status)
    implicit none
    class(topology) :: this
    class(atom) :: atom_
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_topology_append_c(this%ptr, atom_%ptr)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_topology_remove(this, i, status)
    implicit none
    class(topology) :: this
    integer(kind=c_size_t) :: i
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_topology_remove_c(this%ptr, i)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_topology_isbond(this, i, j, result, status)
    implicit none
    class(topology) :: this
    integer(kind=c_size_t) :: i
    integer(kind=c_size_t) :: j
    logical(kind=c_bool) :: result
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_topology_isbond_c(this%ptr, i, j, result)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_topology_isangle(this, i, j, k, result, status)
    implicit none
    class(topology) :: this
    integer(kind=c_size_t) :: i
    integer(kind=c_size_t) :: j
    integer(kind=c_size_t) :: k
    logical(kind=c_bool) :: result
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_topology_isangle_c(this%ptr, i, j, k, result)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_topology_isdihedral(this, i, j, k, m, result, status)
    implicit none
    class(topology) :: this
    integer(kind=c_size_t) :: i
    integer(kind=c_size_t) :: j
    integer(kind=c_size_t) :: k
    integer(kind=c_size_t) :: m
    logical(kind=c_bool) :: result
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_topology_isdihedral_c(this%ptr, i, j, k, m, result)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_topology_bonds_count(this, nbonds, status)
    implicit none
    class(topology) :: this
    integer(kind=c_size_t) :: nbonds
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_topology_bonds_count_c(this%ptr, nbonds)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_topology_angles_count(this, nangles, status)
    implicit none
    class(topology) :: this
    integer(kind=c_size_t) :: nangles
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_topology_angles_count_c(this%ptr, nangles)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_topology_dihedrals_count(this, ndihedrals, status)
    implicit none
    class(topology) :: this
    integer(kind=c_size_t) :: ndihedrals
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_topology_dihedrals_count_c(this%ptr, ndihedrals)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_topology_bonds(this, data, nbonds, status)
    implicit none
    class(topology) :: this
    integer(kind=c_size_t), dimension(:, :) :: data
    integer(kind=c_size_t) :: nbonds
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_topology_bonds_c(this%ptr, data, nbonds)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_topology_angles(this, data, nangles, status)
    implicit none
    class(topology) :: this
    integer(kind=c_size_t), dimension(:, :) :: data
    integer(kind=c_size_t) :: nangles
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_topology_angles_c(this%ptr, data, nangles)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_topology_dihedrals(this, data, ndihedrals, status)
    implicit none
    class(topology) :: this
    integer(kind=c_size_t), dimension(:, :) :: data
    integer(kind=c_size_t) :: ndihedrals
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_topology_dihedrals_c(this%ptr, data, ndihedrals)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_topology_add_bond(this, i, j, status)
    implicit none
    class(topology) :: this
    integer(kind=c_size_t) :: i
    integer(kind=c_size_t) :: j
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_topology_add_bond_c(this%ptr, i, j)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_topology_remove_bond(this, i, j, status)
    implicit none
    class(topology) :: this
    integer(kind=c_size_t) :: i
    integer(kind=c_size_t) :: j
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_topology_remove_bond_c(this%ptr, i, j)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_topology_free(this, status)
    implicit none
    class(topology) :: this
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_topology_free_c(this%ptr)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_atom(this, frame_, idx)
    implicit none
    class(atom) :: this
    class(frame) :: frame_
    integer(kind=c_size_t) :: idx

    this%ptr = chrp_atom_c(frame_%ptr, idx)
end subroutine

subroutine chrp_topology_atom(this, topology_, idx)
    implicit none
    class(atom) :: this
    class(topology) :: topology_
    integer(kind=c_size_t) :: idx

    this%ptr = chrp_topology_atom_c(topology_%ptr, idx)
end subroutine

subroutine chrp_atom_mass(this, mass, status)
    implicit none
    class(atom), intent(in) :: this
    real(kind=c_float) :: mass
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_atom_mass_c(this%ptr, mass)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_atom_mass_set(this, mass, status)
    implicit none
    class(atom) :: this
    real(kind=c_float) :: mass
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_atom_mass_set_c(this%ptr, mass)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_atom_charge(this, charge, status)
    implicit none
    class(atom), intent(in) :: this
    real(kind=c_float) :: charge
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_atom_charge_c(this%ptr, charge)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_atom_charge_set(this, charge, status)
    implicit none
    class(atom) :: this
    real(kind=c_float) :: charge
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_atom_charge_set_c(this%ptr, charge)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_atom_name(this, name, buffsize, status)
    implicit none
    class(atom), intent(in) :: this
    character(len=*) :: name
    integer(kind=c_size_t) :: buffsize
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_atom_name_c(this%ptr, name, buffsize)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_atom_name_set(this, name, status)
    implicit none
    class(atom) :: this
    character(len=*), intent(in) :: name
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_atom_name_set_c(this%ptr, name)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine

subroutine chrp_atom_free(this, status)
    implicit none
    class(atom) :: this
    integer, optional :: status
    integer :: status_tmp_

    status_tmp_ = chrp_atom_free_c(this%ptr)
    if (present(status)) then
        status = status_tmp_
    end if
end subroutine