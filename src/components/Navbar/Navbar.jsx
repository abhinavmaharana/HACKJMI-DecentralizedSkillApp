import React from 'react'
import Button from '../../shared/components/button';
import Navlinks from './Navlinks'

function Navbar() {
  return (
    <nav className='sticky top-0 z-10 backdrop-filter backdrop-blur-lg py-1 rounded-sm'>
        <div className='py-2 flex justify-between items-center px-0.5'>
            <div className='md:my-0 flex items-center'>
                <h3>DecentralizedSkillApp</h3>
            </div>
            <div className='hidden md:flex space-x-4 items-center justify-around w-1/2'>
              <Navlinks />
            </div>
            <div className='flex items-center space-x-6'>
                <div className=''>

                </div>
                <div className=''>
                  <Button buttonContent="Log in" />
                </div>
            </div>
        </div>
    </nav>
  )
}

export default Navbar