import { useEffect, useState } from 'react';

interface Props {
  buttonContent: string;
  paddingX?: string;
  paddingY?: string;
  color?: string;
  shadow?: boolean;
  maxWidth?: string;
  buttonType?: `reset` | `submit` | `button` | undefined;
  width?: string;
  handleClick?: () => void;
}

const Button: React.FC<Props> = ({
  buttonContent,
  color = 'bg-main-blue',
  paddingX = 'px-[25px]',
  paddingY = 'py-[10px]',
  shadow = false,
  maxWidth = 'max-w-[300px]',
  buttonType = 'button',
  width = 'w-[150px]',
  handleClick,
}) => {
  const [style, setStyle] = useState('');

  useEffect(() => {
    const defaultStyle = `rounded-md  hover:font-bold`;
    const shadowStyle = shadow ? 'drop-shadow-[0_4px_4px_rgba(0,0,0,0.25)]' : '';
    const dynamicStyle = color === 'bg-main-blue' || color === 'bg-green' ? 'text-buttonWhite' : 'text-black';
    const joined = [defaultStyle, dynamicStyle, shadowStyle, color, paddingX, paddingY, maxWidth, width].join(' ');
    setStyle(joined);
  }, [shadow, color, paddingX, paddingY, maxWidth, width, buttonType, handleClick]);

  return (
    <div>
      <button onClick={handleClick} type={buttonType ? `${buttonType}` : `button`} className={style}>
        {buttonContent}
      </button>
    </div>
  );
};
export default Button;
